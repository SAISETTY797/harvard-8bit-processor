# ============================================================
#  Makefile — Harvard 8-bit Processor (Icarus Verilog)
# ============================================================

IVERILOG = iverilog
VVP      = vvp
GTKWAVE  = gtkwave

SRC_DIR  = src
TB_DIR   = tb
SIM_DIR  = sim

.PHONY: all sim_alu sim_top sim_fetch sim_decode sim_regfile sim_dmem \
        wave_alu wave_top clean

# ── Default: run everything ─────────────────────────────────
all: sim_alu sim_top sim_fetch sim_regfile sim_dmem
	@echo ""
	@echo "✅  All simulations complete. VCD files are in $(SIM_DIR)/"

# ── ALU ─────────────────────────────────────────────────────
sim_alu:
	@mkdir -p $(SIM_DIR)
	$(IVERILOG) -o $(SIM_DIR)/alu_sim \
	    -I$(SRC_DIR) \
	    $(TB_DIR)/alu_tb.v
	cd $(SIM_DIR) && $(VVP) alu_sim
	@echo "✔  ALU simulation done."

wave_alu:
	$(GTKWAVE) $(SIM_DIR)/alu.vcd &

# ── Full Processor (Top) ─────────────────────────────────────
sim_top:
	@mkdir -p $(SIM_DIR)
	$(IVERILOG) -o $(SIM_DIR)/top_sim \
	    -I$(SRC_DIR) \
	    $(TB_DIR)/top_tb.v
	cd $(SIM_DIR) && $(VVP) top_sim
	@echo "✔  Top-level simulation done."

wave_top:
	$(GTKWAVE) $(SIM_DIR)/top.vcd &

# ── Fetch Unit ───────────────────────────────────────────────
sim_fetch:
	@mkdir -p $(SIM_DIR)
	$(IVERILOG) -o $(SIM_DIR)/fetch_sim \
	    -I$(SRC_DIR) \
	    $(TB_DIR)/fetch_unit_tb.v
	cd $(SIM_DIR) && $(VVP) fetch_sim
	@echo "✔  Fetch unit simulation done."

# ── Decode Unit ──────────────────────────────────────────────
sim_decode:
	@mkdir -p $(SIM_DIR)
	$(IVERILOG) -o $(SIM_DIR)/decode_sim \
	    -I$(SRC_DIR) \
	    $(TB_DIR)/decode_unit_tb.v
	cd $(SIM_DIR) && $(VVP) decode_sim
	@echo "✔  Decode unit simulation done."

# ── Register File ────────────────────────────────────────────
sim_regfile:
	@mkdir -p $(SIM_DIR)
	$(IVERILOG) -o $(SIM_DIR)/regfile_sim \
	    -I$(SRC_DIR) \
	    $(TB_DIR)/register_file_tb.v
	cd $(SIM_DIR) && $(VVP) regfile_sim
	@echo "✔  Register file simulation done."

# ── Data Memory ──────────────────────────────────────────────
sim_dmem:
	@mkdir -p $(SIM_DIR)
	$(IVERILOG) -o $(SIM_DIR)/dmem_sim \
	    -I$(SRC_DIR) \
	    $(TB_DIR)/data_memory_tb.v
	cd $(SIM_DIR) && $(VVP) dmem_sim
	@echo "✔  Data memory simulation done."

# ── Clean ────────────────────────────────────────────────────
clean:
	rm -rf $(SIM_DIR)
	@echo "🧹  Cleaned simulation outputs."
