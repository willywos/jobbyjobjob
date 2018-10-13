class JobPostingSerializer
  include JSONAPI::Serializer

  attributes(
    :title,
    :logo,
    :description,
    :publish_date,
    :company,
    :job_board,
    :url
  )
end