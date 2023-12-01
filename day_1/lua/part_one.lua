local total_lines = vim.api.nvim_buf_line_count(0)

local total = 0

for i = 1, total_lines, 1 do
  local line = vim.fn.getline(i)

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
