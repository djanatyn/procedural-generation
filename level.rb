#!/bin/env ruby

class Level
  attr_reader :cells
  attr_writer :entities

  def initialize(height, width)
    @width = width
    @height = height
    @cells = []; @entities = []

    # build up an empty array of cells
    (0..@width-1).each do |column|
      empty_tile = { tile: '#', objects: [] }
      @cells[column] ||= []
      @cells[column] = [empty_tile] * height
    end
  end

  def display
    (0..@width-1).each do |col|
      @cells[col].each do |tile|
        print tile[:tile]
      end
      print "\n"
    end
  end

  def add_square topx, topy, length
    (topx..topx+length).each do |x|
      (topy..topy+length).each do |y|
        @cells[x][y] = { tile: '.', objects: [] }
      end
    end
  end

  def rand_square
    topx = rand (1..@width-1)
    topy = rand (1..@height-1)

  end
end

# test making a new level
level = Level.new(80,24)
level.add_square(5,5,5)
level.display
