class Node < ApplicationRecord
  has_many :children, class_name: "Node"
  belongs_to :parent, class_name: "Node", optional: true
  accepts_nested_attributes_for :parent
end
