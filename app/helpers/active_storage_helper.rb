module ActiveStorageHelper

  def json_mock_files(files)
    return unless files.attached?
    files.includes(:blob).to_json(include: { blob: { only: [:filename, :byte_size, :signed_url], methods: :url } })
  end
end