module NodesHelper
  def showNestedChildren(node, level)
    puts node.children.to_yaml
    if node.children.any?
      returnme = "<details class=\"indent\"><summary>#{node.title}</summary>".html_safe
      node.children.each do |nestednode|
        returnme += (showNestedChildren(nestednode, level + 1)).html_safe
      end
      returnme += "</details>".html_safe
    else
      returnme = "<div class=\"indent\">#{node.title}</div>".html_safe
    end
  end
end
