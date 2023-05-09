class StaticPagesController < ApplicationController
  def top
    TestJob.perform_later
  end
end
