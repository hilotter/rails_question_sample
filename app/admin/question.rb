ActiveAdmin.register Question do
  permit_params :title, :image, :image_cache, :publish_datetime_date, :publish_datetime_time_hour, :publish_datetime_time_minute, answers_attributes: [:id, :answer_text, :total_count, :_destroy]

  controller do
    def scoped_collection
      Question.includes(:answers)
    end
  end

  index do
    selectable_column
    id_column
    column :title
    column :image do |i|
      image_tag(i.image.url, height: "64")
    end
    column :publish_datetime

    column :answer do |i|
      table_for i.answers do
        column :answer_text
        column :total_count
      end
    end

    column :updated_at
    actions
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs "Details" do
      f.input :title
      f.input :image, :image_preview => true
      f.input :publish_datetime, as: :just_datetime_picker
      f.input :image_cache, as: :hidden
    end

    f.inputs do
      f.has_many :answers, heading: 'Answers', allow_destroy: true, new_record: true do |a|
        a.input :answer_text
        a.input :total_count
      end
    end

    f.actions
  end

  show do |i|
    attributes_table do
      row :id
      row :title
      row :image do
        image_tag(i.image.url)
      end
      row :publish_datetime
      row :created_at
      row :updated_at
    end

    panel 'Answers' do
      attributes_table_for i.answers do
        row :id
        row :answer_text
        row :total_count
      end
    end
  end
end
