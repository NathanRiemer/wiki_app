json.array!(@revisions) do |revision|
  json.extract! revision, :id, :content, :user_id, :article_id
  json.url revision_url(revision, format: :json)
end
