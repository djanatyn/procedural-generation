#!/bin/env ruby

class Level
  attr_reader :cells
  attr_writer :entities

  def initialize(width, height)
    @width = width
    @height = height
    @cells = []; @entities = []

    # build up an empty array of cells
    (0..@height-1).each do |column|
      empty_tile = { tile: '#', objects: [] }
      @cells[column] ||= []
      @cells[column] = [empty_tile] * @width
    end
  end

  def display
    (0..@height-1).each do |col|
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

  def rand_square length
    topx = rand (1..@width-1)
    topy = rand (1..@height-1)

    self.add_square(topx,topy,length)
  end

  def valid? x,y
    not (@cells[x].nil? || @cells[x][y].nil?)
  end

  def wall? x,y
    self.valid?(x,y) and @cells[x][y][:tile] == '#'
  end
end

# test making a new level
level = Level.new 80, 24
level.display
