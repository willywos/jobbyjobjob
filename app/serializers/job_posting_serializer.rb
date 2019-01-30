class JobPostingSerializer
  include JSONAPI::Serializer

  attributes(
    :title,
    :logo,
    :description,
    :description_text,
    :publish_date,
    :company,
    :job_board,
    :url
  )
end
