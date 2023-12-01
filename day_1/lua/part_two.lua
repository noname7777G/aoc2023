local noun_table = {
  one = "o1e",
  two = "t2o",
  three = "t3e",
  four = "4",
  five = "5e",
  six = "6",
  seven = "7n",
  eight = "e8t",
  nine = "n9e",
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

Parse_numbers = function()
  local total = 0

  for _, line in pairs(vim.api.nvim_buf_get_lines(0, 0, -1, false)) do
    for _, noun in ipairs(noun_table) do
      line = line:gsub(noun, noun_table)
    end

    line:gsub("^%D-(%d).-(%d?)%D-$", function(d_1, d_2)

    if d_2 ~= "" then
      total = total + tonumber(d_1 .. d_2)
    else
      total = total + tonumber(d_1 .. d_1)
    end
    end)
  end
end

local total_time = 0

for i = 0, 1000, 1 do
  local start = os.clock()

  Parse_numbers()

  local stop = os.clock()

  local time = stop - start

  total_time = total_time + time

end

print("Average:", total_time / 1000)

