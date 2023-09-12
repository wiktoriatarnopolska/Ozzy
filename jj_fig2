using Gradus
using Plots

#defining customised bins
bins = collect(range(0.1, 1.4, 200))

# Kerr metric BH with spin a = 0.95
m = KerrMetric(1.0, 0.95)

# defining conventional Shakura-Sunyaev models with varying Eddington ratio
ssd1 = ShakuraSunyaev(m, eddington_ratio = 0.1)
ssd2 = ShakuraSunyaev(m, eddington_ratio = 0.2)
ssd3 = ShakuraSunyaev(m, eddington_ratio = 0.3)
# geometrically thin optically thin disc 
# (chosen due to different intersection algorithm designed for infinite thin planes)
d_gt = ThinDisc(0.0, Inf)

#using self-consisted emissivity profiles and lamppost model as height h = 4.0
prof0 = emissivity_profile(m, d_gt, LampPostModel(h = 4.0); n_samples = 2000)
prof1 = emissivity_profile(m, ssd1, LampPostModel(h = 4.0); n_samples = 2000)
prof2 = emissivity_profile(m, ssd2, LampPostModel(h = 4.0); n_samples = 2000)
prof3 = emissivity_profile(m, ssd3, LampPostModel(h = 4.0); n_samples = 2000)

plot(prof0, label = "Edd. ratio 0%", linecolor = "rebeccapurple", title = "Emissivity profiles and Eddington ratio")
plot!(prof1, label = "Edd. ratio 10%", linecolor = "royalblue", linestyle=:dot)
plot!(prof2, label = "Edd. ratio 20%", linecolor = "orchid2", linestyle=:dash)
plot!(prof3, label = "Edd. ratio 30%", linecolor = "maroon", linestyle=:dashdot)
