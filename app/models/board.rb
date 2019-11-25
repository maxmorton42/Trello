class Board < ApplicationRecord
  has_many :lists, dependent: :destroy

  def self.single_board(board_id)
    Board.find_by_sql(["
      SELECT * 
      FROM boards AS b
      WHERE b.id = ? 
    ", board_id]).first
  end

  def self.all_boards
    Board.find_by_sql(
      "SELECT *
      FROM boards
      ORDER BY boards.name"
    )
  end

  def self.create_board(p)
    Board.find_by_sql(["
      INSERT INTO boards (name, created_at, updated_at)
      VALUES (:name, :created_at, :updated_at);
    ", {
      name: p[:name],
      created_at: DateTime.now,
      updated_at: DateTime.now
    }])
  end

  
end
