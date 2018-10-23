module ResumesHelper

  def check_value(resume_data, array_of_fields)
    tmp_data = resume_data
    array_of_fields.each do |f|
      tmp_data = tmp_data.try(:[], f) || ''
      break if tmp_data.class == String
    end
    return tmp_data
  end
end
