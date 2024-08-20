class MovieForm
  include ActiveModel::Model

  attr_accessor :title, :url, :file

  validates :title, :file, presence: true

  def initialize(params = nil, movie = nil)
    @movie = movie || Movie.new
    if movie.present?
      self.title = movie.title
      self.url = movie.url
    end

    super(params) if params
  end

  # Save the movie (for both create and update)
  def save
    return false unless valid?

    s3_file = UploadS3Service.new(file.path, file.original_filename).perform if File.exist?(file)
    @movie.update! title: title, url: s3_file[0]
  end

  # Useful for checking if the record is persisted (i.e., edit vs new)
  def persisted?
    @movie.persisted?
  end
end
