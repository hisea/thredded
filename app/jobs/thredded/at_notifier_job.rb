# frozen_string_literal: true
module Thredded
  class AtNotifierJob < ::ActiveJob::Base
    queue_as :default

    def perform(post_type, post_id)
      post = post_type.to_s.constantize.find(post_id)

      NotifyMentionedUsers.new(post).run
    end
  end
end
