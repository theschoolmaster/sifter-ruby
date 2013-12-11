# Wrapper for a Sifter project. Fetch projects using Sifter::Account.
class Sifter::DetailedIssue < Hashie::Dash

  property :number
  property :subject
  property :description
  property :priority
  property :status
  property :assignee_name
  property :assignee_email
  property :category_name
  property :milestone_name
  property :opener_name
  property :opener_email
  property :comment_count
  property :attachment_count
  property :created_at
  property :updated_at
  property :url
  property :api_url
  property :comments_url
  property :comments

  def initialize(api_issue_url)
    super(
      Sifter.
        get(api_issue_url).
        parsed_response["issue"]
      )
  end

  # Fetch all the comments on this issue. Returns an array of Sifter::Comments
  # objects.
  def comments
    Sifter.
      get(api_comments_url).
      fetch("comments", []).
      map { |i| Sifter::Comment.new(i) }
  end

end
