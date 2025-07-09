local M = {}

function M.insert_swagger_doc()
    local swagger_lines = {
        "--- @Summary Summary of the endpoint",
        "--- @Description Description of what this endpoint does",
        "--- @Tags tag1, tag2",
        "--- @Accept json",
        "--- @Produce json",
        "--- @Param id path int true \"ID of the object\"",
        "--- @Success 200 {object} model.Object",
        "--- @Failure 400 {object} model.ErrorResponse",
        "--- @Router /path [get]",
    }

    local row, _ = table.unpack(vim.api.nvim_win_get_cursor(0))
    vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, swagger_lines)
end

return M
