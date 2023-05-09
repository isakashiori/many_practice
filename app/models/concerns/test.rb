# consernのテストとして作成しています。

# module M
#   extend ActiveSupport::consern

#   included do
#     scope :disabled, -> { where(disabled: true) }
#   end

#   class_methods do
#     何かしらの共通処理
#   end
# end

# consernを使用すると時は上記のような書き方になる

# module M
#   def self.included(base)
#     base.extend ClassMethods
#     base.class_eval do
#       scope :disabled, -> {where(disabled: true)}
#     end
#   end

#   module ClassMethods
#     何かしらの処理
#   end
# end

# 使用しない場合の処理については上記のような形になる

# https://sakaishun.com/2021/10/17/activesupport-concern/



