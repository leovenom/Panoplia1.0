module JobsHelper

  def job_type(job_type)
    if job_type == "Full-time"
      content_tag :span, "#{job_type}", class: "tag is-primaryy"
    elsif job_type == "Part-time"
      content_tag :span, "#{job_type}", class: "tag is-link"
    elsif job_type == "Freelance"
      content_tag :span, "#{job_type}", class: "tag is-green"
    elsif job_type == "Contract"
      content_tag :span, "#{job_type}", class: "tag is-info"
    else
      ""
    end
  end

  def job_author(job)
    user_signed_in? && current_user.id == job.user_id
  end
end