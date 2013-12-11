# Wrapper for a Sifter project. Fetch projects using Sifter::Account.
class Sifter::Issue < Hashie::Dash

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
  #property :comments

  def comments
    @comments ||= Sifter.
                    get(self.api_url).
                    parsed_response["issue"]["comments"].
                    map { |c| Sifter::Comment.new(c) }
  end

end
