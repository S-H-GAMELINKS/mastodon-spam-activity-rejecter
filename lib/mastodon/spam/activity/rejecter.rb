# frozen_string_literal: true

require_relative "rejecter/version"

module Mastodon
  module Spam
    module Activity
      module Rejecter
        def process_status
          @tags                 = []
          @mentions             = []
          @silenced_account_ids = []
          @params               = {}
      
          process_status_params
          process_tags
          process_audience
      
          ApplicationRecord.transaction do
            @status = Status.create!(@params)
            attach_tags(@status)

            if like_a_spam?
              @status = nil
              raise ActiveRecord::Rollback
            end
          end

          return if @status.nil?
      
          resolve_thread(@status)
          fetch_replies(@status)
          distribute
          forward_for_reply
        end

        FILTER_MINIMUM_MENTIONS = ENV.fetch('FILTER_MINIMUM_MENTIONS', 1).to_i

        def like_a_spam?
          !@status.account.local? && @mentions.count > FILTER_MINIMUM_MENTIONS
        end
      end
    end
  end
end


ActivityPub::Activity::Create.prepend(Mastodon::Spam::Activity::Rejecter)
