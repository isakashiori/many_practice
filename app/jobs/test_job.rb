class TestJob < ApplicationJob
  queue_as :default

  def perform(*args)
    p "定期実行テストテストテスト"
  end
end
