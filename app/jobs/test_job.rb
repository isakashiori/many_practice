class TestJob < ApplicationJob
  queue_as :default

  def perform(*args)
    p "お互い不安にさせることはやめよう"
  end
end
