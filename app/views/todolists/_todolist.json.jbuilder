json.extract! todolist, :id, :title, :description, :status, :deadline_date, :created_at, :updated_at
json.url todolist_url(todolist, format: :json)
