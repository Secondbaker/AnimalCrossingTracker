class FindLabels < ActiveRecord::Migration[6.0]
  def up
  end
  # We don't really need to undo this on the way down.  
  # If you keep going down, the column will just be deleted.
  def down
  end
end
