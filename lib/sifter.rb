require "httparty"
require "hashie"

class Sifter

  include HTTParty

  autoload :Account,        "sifter/account"
  autoload :Project,        "sifter/project"
  autoload :Issue,          "sifter/issue"
  autoload :DetailedIssue,  "sifter/detailed_issue"
  autoload :Comment,        "sifter/comment"
  autoload :Attachment,     "sifter/attachment"

  # Wrapper around a milestone.
  class Milestone < Hashie::Dash

    property :name
    property :due_date
    property :url
    property :api_url
    property :issues_url
    property :api_issues_url

  end

  # Wrapper around a person.
  class Person < Hashie::Dash

    property :username
    property :first_name
    property :last_name
    property :email

  end

end
