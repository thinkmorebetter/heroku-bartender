require "git"
module Bartender
  class Log
    def self.get_log
      Git.open('.').log
    end
    def self.generate_commits
      get_log.map do |item|
        Commit.new({ :sha   => item.sha         , :author  => item.author.name,
                     :email => item.author.email, :message => item.message,
                     :date  => item.date
                   })
      end
    end
  end
end