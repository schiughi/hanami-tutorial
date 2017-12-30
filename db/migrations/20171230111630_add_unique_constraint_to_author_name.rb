Hanami::Model.migration do
  change do
    alter_table(:authors) do
      add_unique_constraint :name
    end
  end
end
