# Wrapper around a comment
# https://sifterapp.com/developer/resources/issues#detail
class Sifter::Comment < Hashie::Dash
  #"comments": [
  #  {
  #    "body": "Proin dictum dignissim metus.",
  #    "priority": "Trivial",
  #    "status": "Open",
  #    "category": "Bug",
  #    "commenter": "Adam Keys",
  #    "commenter_email": "adam@example.com",
  #    "opener": "Adam Keys",
  #    "opener_email": "adam@example.com",
  #    "project": "Rhino",
  #    "milestone_name": null,
  #    "assignee_name": null,
  #    "assignee_email": null,
  #    "created_at": "2010/05/16 19:13:16 +0000",
  #    "updated_at": "2010/05/16 19:13:16 +0000",

  property :body
  property :priority
  property :status
  property :category
  property :commenter
  property :commenter_email
  property :opener
  property :opener_email
  property :project
  property :milestone_name
  property :assignee_name
  property :assignee_email
  property :created_at
  property :updated_at
  property :attachments

  # Fetch all the attachments on this comment. Returns an array of Sifter::Attachments
  # objects.
  def attachment_objs
    @attachments_objs ||= self.attachments.map { |i| Sifter::Attachment.new(i) }
  end

end
