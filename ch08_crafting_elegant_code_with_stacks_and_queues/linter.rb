class Linter

  attr_reader :error

  def initialize
    # 用一个普通的数组当栈
    @stack = []
  end

  def lint(text)
    # 循环读取文件的每个字符
    text.each_char.with_index do |char, index|

      if opening_brace?(char)

        # 如果读到左括号，则将其压入栈中
        @stack.push(char)
      elsif closing_brace?(char)

        if closes_most_recent_opening_brace?(char)

          # 如果读到右括号，并且它与栈顶的左括号匹配，则将栈顶弹出
          @stack.pop

        else # 如果读到右括号，但它与栈顶的左括号不匹配
 
          @error = "Incorrect closing brace: #{char} at index #{index}"
          return
        end
      end

    end

    if @stack.any?
      # 如果读完所有字符后栈不为空，就表示文中存在着没有响应右括号的左括号
      @error = "#{@stack.last} does not have a closing brace"
    end
  end

  private

  def opening_brace?(char)
    ["(", "[", "{"].include?(char)
  end

  def closing_brace?(char)
    [")", "]", "}"].include?(char)
  end

  def opening_brace_of(char)
    {")" => "(", "]" => "[", "}" => "{"}[char]
  end

  def most_recent_opening_brace
    @stack.last 
  end

  def closes_most_recent_opening_brace?(char)
    opening_brace_of(char) == most_recent_opening_brace
  end

end

linter = Linter.new
linter.lint("( var x = { y: [1, 2, 3] } )")
puts linter.error

linter = Linter.new
linter.lint("( var x = { y: [1, 2, 3] ) }")
puts linter.error

linter = Linter.new
linter.lint("( var x = { y: [1, 2, 3] }")
puts linter.error