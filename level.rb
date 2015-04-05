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
end

# test making a new level
level = Level.new(80,24)
level.display
