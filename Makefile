# ============================================================
#  Makefile — Harvard 8-bit Processor (Icarus Verilog)
# ============================================================

IVERILOG = iverilog
VVP      = vvp
GTKWAVE  = gtkwave

TB_DIR   = tb
SIM_DIR  = sim

.PHONY: all sim_top wave_top clean

# ── Default ──────────────────────────────────────────────────
all: sim_top
	@echo ""
	@echo "✅  Simulation complete. VCD file is in $(SIM_DIR)/"

# ── Full Processor (Top) ─────────────────────────────────────
sim_top:
	@mkdir -p $(SIM_DIR)
	$(IVERILOG) -o $(SIM_DIR)/top_sim \
	    $(TB_DIR)/top_tb.v
	cd $(SIM_DIR) && $(VVP) top_sim
	@echo "✔  Top-level simulation done."

wave_top:
	$(GTKWAVE) $(SIM_DIR)/top.vcd &

# ── Clean ────────────────────────────────────────────────────
clean:
	rm -rf $(SIM_DIR)
	@echo "🧹  Cleaned simulation outputs."
