# Wrapper for a Sifter project. Fetch projects using Sifter::Account.
class Sifter::Project < Hashie::Dash

  property :name
  property :archived
  property :primary_company_name
  property :url
  property :api_url
  property :issues_url
  property :milestones_url
  property :people_url
  property :api_milestones_url
  property :api_people_url
  property :api_issues_url
  property :api_categories_url

  # Fetch all the issues on this project. Returns an array of Sifter::Issue
  # objects.
  def issues
    Sifter.
      get(api_issues_url).
      fetch("issues", []).
      map { |i| Sifter::Issue.new(i) }
  end

  # Fetch all the detailed issues on this project. Returns an array of Sifter::DetailedIssue
  # objects (complete with comments).
  def detailed_issues
    Sifter.
      get(api_issues_url).
      fetch("issues", []).
      map { |i| Sifter::DetailedIssue.new(i['api_url']) }
  end

  # Fetch all the milestones for this project. Returns an array of
  # Sifter::Milestone objects.
  def milestones
    Sifter.
      get(api_milestones_url).
      fetch("milestones", []).
      map { |m| Sifter::Milestone.new(m) }
  end

  # Fetch all the people linked to this project. Returns an array of
  # Sifter::Person objects.
  def people
    Sifter.
      get(api_people_url).
      fetch("people", []).
      map { |p| Sifter::Person.new(p) }
  end

  # Fetch all the categories linked to this project. Returns an array of
  # Sifter::Category objects.
  def categories
    Sifter.
      get(api_categories_url).
      fetch("categories", []).
      map { |c| Sifter::Category.new(c) }
  end

end
