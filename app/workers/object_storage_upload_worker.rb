class ObjectStorageUploadWorker
  include Sidekiq::Worker
  include DedicatedSidekiqQueue

  sidekiq_options retry: 5

  def perform(uploader_class_name, subject_class_name, file_field, subject_id)
    uploader_class = uploader_class_name.constantize
    subject_class = subject_class_name.constantize

    return unless uploader_class < ObjectStorage::Concern
    return unless uploader_class.object_store_enabled?
    return unless uploader_class.licensed?
    return unless uploader_class.background_upload_enabled?

    subject = subject_class.find(subject_id)
    uploader = subject.public_send(file_field) # rubocop:disable GitlabSecurity/PublicSend
    uploader.migrate!(ObjectStorage::Store::REMOTE)
  rescue RecordNotFound
    # does not retry when the record do not exists
    Rails.logger.warn("Cannot find subject #{subject_class} with id=#{subject_id}.")
  end
end
