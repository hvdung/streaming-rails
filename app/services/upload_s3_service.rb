class UploadS3Service
  attr_reader :file_path, :filename

  def initialize(file_path, filename)
    @file_path = file_path
    @filename = filename
  end

  def perform
    s3_path = "upload_folder/#{filename}"
    s3 = Aws::S3::Resource.new(region: ENV["AWS_REGION"])

    s3_obj = s3.bucket(ENV["AWS_BUCKET_NAME"]).object(s3_path)

    file_params = {
      body: File.read(file_path),
      content_type: "application/vnd.ms-excel.sheet.macroEnabled.12",
      acl: "public-read",
      tagging: "tmp=true"
    }
    s3_obj.put file_params

    return s3_obj.public_url, filename
  end
end