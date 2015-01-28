ActiveAdmin.register Answer do
  permit_params :answer_text, :total_count

  controller do
    def scoped_collection
      Answer.includes(:question)
    end
  end

  index do
    selectable_column
    id_column
    column :question
    column :answer_text
    column :total_count
    column :updated_at
    actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :question
      f.input :answer_text
      f.input :total_count
    end
    f.actions
  end
end
