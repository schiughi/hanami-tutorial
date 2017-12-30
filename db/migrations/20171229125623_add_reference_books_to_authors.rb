Hanami::Model.migration do
  change do
    alter_table(:books) do
      add_foreign_key :author_id, :authors, on_delete: :cascade
    end
  end
end
