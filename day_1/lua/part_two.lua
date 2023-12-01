local total_lines = vim.api.nvim_buf_line_count(0)

local total = 0

local noun_table = {
  one = 1,
  two = 2,
  three = 3,
  four = 4,
  five = 5,
  six = 6,
  seven = 7,
  eight = 8,
  nine = 9,
  "one",
  "two",
  "three",
  "four",
  "five",
  "six",
  "seven",
  "eight",
  "nine",
}

for i = 1, total_lines, 1 do
  local line = vim.fn.getline(i)

  for _, noun in ipairs(noun_table) do
    line = line:gsub(noun, noun_table[noun])
  end

  print(line)

  local digits = line:gsub("%D", "")

  if digits:len() == 1 then
    digits = digits:gsub("^(%d)$", "%1%1")
  end

  if digits:len() > 2 then
    local d_1, d_2
    d_1, d_2 = digits:match("^(%d)%d-(%d)$")
    digits = d_1 .. d_2
  end

  total = total + tonumber(digits)
end
print(total)
