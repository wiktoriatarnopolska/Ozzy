using Gradus
using Plots

function calculate_line_profile(m, x, d, bins, plane)
    _, f = lineprofile(
        m, 
        x, 
        d, 
        minrₑ = Gradus.isco(m) + 5e-2,
        method = TransferFunctionMethod(), 
        verbose = true,
        bins = bins,
        maxrₑ = 500.0,
        # resolution
        numrₑ = 250,
        β₀ = 2.0,
        Nr = 5000,
    )
    return f
end

# define custom bins for g
bins = collect(range(0.1, 1.4, 200))

# define the plane to perform the binning over
plane = PolarPlane(GeometricGrid(); Nr = 1000, Nθ = 1000, r_max = 1000.0)

# inclination
x = SVector(0.0, 1000.0, deg2rad(20), 0.0)

#geometric thin disc
d_gt = ThinDisc(0.0, Inf)


m1 = JohannsenMetric(M=1.0, a = 0.0, α13 = -0.35, ϵ3 = 0.0)

d01 = ShakuraSunyaev(m1, eddington_ratio = 0.1)
d02 = ShakuraSunyaev(m1, eddington_ratio = 0.2)
d03 = ShakuraSunyaev(m1, eddington_ratio = 0.3)

edrat0 = calculate_line_profile(m1, x, d_gt, bins, plane)
edrat10 = calculate_line_profile(m1, x, d01, bins, plane)
edrat20 = calculate_line_profile(m1, x, d02, bins, plane)
edrat30 = calculate_line_profile(m1, x, d03, bins, plane)

plot(bins, edrat0, label = "Eddington ratio 0%", title = "α13 = -0.35, a = 0.0", legend=:topleft)
plot!(bins, edrat10, label = "Eddington ratio 10%")
plot!(bins, edrat20, label = "Eddington ratio 20%")
plot!(bins, edrat30, label = "Eddington ratio 30%")

m2 = JohannsenMetric(M=1.0, a = 0.9, α13 = -0.35, ϵ3 = 0.0) #all OK

d01 = ShakuraSunyaev(m2, eddington_ratio = 0.1)
d02 = ShakuraSunyaev(m2, eddington_ratio = 0.2)
d03 = ShakuraSunyaev(m2, eddington_ratio = 0.3)

edrat0 = calculate_line_profile(m2, x, d_gt, bins, plane)
edrat10 = calculate_line_profile(m2, x, d01, bins, plane)
edrat20 = calculate_line_profile(m2, x, d02, bins, plane)
edrat30 = calculate_line_profile(m2, x, d03, bins, plane)

plot(bins, edrat0, label = "Eddington ratio 0%", title = "α13 = -0.35, a = 0.9", legend=:topleft)
plot!(bins, edrat10, label = "Eddington ratio 10%")
plot!(bins, edrat20, label = "Eddington ratio 20%")
plot!(bins, edrat30, label = "Eddington ratio 30%")

m3 = JohannsenMetric(M=1.0, a = 0.998, α13 = -0.35, ϵ3 = 0.0) # all OK

d01 = ShakuraSunyaev(m3, eddington_ratio = 0.1)
d02 = ShakuraSunyaev(m3, eddington_ratio = 0.2)
d03 = ShakuraSunyaev(m3, eddington_ratio = 0.3)

edrat0 = calculate_line_profile(m3, x, d_gt, bins, plane)
edrat10 = calculate_line_profile(m3, x, d01, bins, plane)
edrat20 = calculate_line_profile(m3, x, d02, bins, plane)
edrat30 = calculate_line_profile(m3, x, d03, bins, plane)

plot(bins, edrat0, label = "Eddington ratio 0%", title = "α13 = -0.35, a = 0.998", legend=:topleft)
plot!(bins, edrat10, label = "Eddington ratio 10%")
plot!(bins, edrat20, label = "Eddington ratio 20%")
plot!(bins, edrat30, label = "Eddington ratio 30%")


m1 = JohannsenMetric(M=1.0, a = 0.0, α13 = 0.0, ϵ3 = 0.0)

d01 = ShakuraSunyaev(m1, eddington_ratio = 0.1)
d02 = ShakuraSunyaev(m1, eddington_ratio = 0.2)
d03 = ShakuraSunyaev(m1, eddington_ratio = 0.3)

edrat0 = calculate_line_profile(m1, x, d_gt, bins, plane)
edrat10 = calculate_line_profile(m1, x, d01, bins, plane)
edrat20 = calculate_line_profile(m1, x, d02, bins, plane)
edrat30 = calculate_line_profile(m1, x, d03, bins, plane)

plot(bins, edrat0, label = "Eddington ratio 0%", title = "α13 = 0.0, a = 0.0", legend=:topleft)
plot!(bins, edrat10, label = "Eddington ratio 10%")
plot!(bins, edrat20, label = "Eddington ratio 20%")
plot!(bins, edrat30, label = "Eddington ratio 30%")

m2 = JohannsenMetric(M=1.0, a = 0.9, α13 = 0.0, ϵ3 = 0.0) # spike at eddington ratio 30%

d01 = ShakuraSunyaev(m2, eddington_ratio = 0.1)
d02 = ShakuraSunyaev(m2, eddington_ratio = 0.2)
d03 = ShakuraSunyaev(m2, eddington_ratio = 0.3) #

edrat0 = calculate_line_profile(m2, x, d_gt, bins, plane)
edrat10 = calculate_line_profile(m2, x, d01, bins, plane)
edrat20 = calculate_line_profile(m2, x, d02, bins, plane)
edrat30 = calculate_line_profile(m2, x, d03, bins, plane) #

plot(bins, edrat0, label = "Eddington ratio 0%", title = "α13 = 0.0, a = 0.9", legend=:topleft)
plot!(bins, edrat10, label = "Eddington ratio 10%")
plot!(bins, edrat20, label = "Eddington ratio 20%")
plot!(bins, edrat30, label = "Eddington ratio 30%") #

m3 = JohannsenMetric(M=1.0, a = 0.998, α13 = 0.0, ϵ3 = 0.0)

d01 = ShakuraSunyaev(m3, eddington_ratio = 0.1)
d02 = ShakuraSunyaev(m3, eddington_ratio = 0.2)
d03 = ShakuraSunyaev(m3, eddington_ratio = 0.3)

edrat0 = calculate_line_profile(m3, x, d_gt, bins, plane)
edrat10 = calculate_line_profile(m3, x, d01, bins, plane)
edrat20 = calculate_line_profile(m3, x, d02, bins, plane)
edrat30 = calculate_line_profile(m3, x, d03, bins, plane)

plot(bins, edrat0, label = "Eddington ratio 0%", title = "α13 = 0.0, a = 0.998", legend=:topleft)
plot!(bins, edrat10, label = "Eddington ratio 10%")
plot!(bins, edrat20, label = "Eddington ratio 20%")
plot!(bins, edrat30, label = "Eddington ratio 30%")

m1 = JohannsenMetric(M=1.0, a = 0.0, α13 = 0.35, ϵ3 = 0.0)

d01 = ShakuraSunyaev(m1, eddington_ratio = 0.1)
d02 = ShakuraSunyaev(m1, eddington_ratio = 0.2)
d03 = ShakuraSunyaev(m1, eddington_ratio = 0.3)

edrat0 = calculate_line_profile(m1, x, d_gt, bins, plane)
edrat10 = calculate_line_profile(m1, x, d01, bins, plane)
edrat20 = calculate_line_profile(m1, x, d02, bins, plane)
edrat30 = calculate_line_profile(m1, x, d03, bins, plane)

plot(bins, edrat0, label = "Eddington ratio 0%", title = "α13 = 0.35, a = 0.0", legend=:topleft)
plot!(bins, edrat10, label = "Eddington ratio 10%")
plot!(bins, edrat20, label = "Eddington ratio 20%")
plot!(bins, edrat30, label = "Eddington ratio 30%")

m2 = JohannsenMetric(M=1.0, a = 0.9, α13 = 0.35, ϵ3 = 0.0)

d01 = ShakuraSunyaev(m2, eddington_ratio = 0.1)
d02 = ShakuraSunyaev(m2, eddington_ratio = 0.2)
d03 = ShakuraSunyaev(m2, eddington_ratio = 0.3)

edrat0 = calculate_line_profile(m2, x, d_gt, bins, plane)
edrat10 = calculate_line_profile(m2, x, d01, bins, plane)
edrat20 = calculate_line_profile(m2, x, d02, bins, plane)
edrat30 = calculate_line_profile(m2, x, d03, bins, plane)

plot(bins, edrat0, label = "Eddington ratio 0%", title = "α13 = 0.35, a = 0.9", legend=:topleft)
plot!(bins, edrat10, label = "Eddington ratio 10%")
plot!(bins, edrat20, label = "Eddington ratio 20%")
plot!(bins, edrat30, label = "Eddington ratio 30%")

m3 = JohannsenMetric(M=1.0, a = 0.998, α13 = 0.35, ϵ3 = 0.0)

d01 = ShakuraSunyaev(m3, eddington_ratio = 0.1)
d02 = ShakuraSunyaev(m3, eddington_ratio = 0.2)
d03 = ShakuraSunyaev(m3, eddington_ratio = 0.3)

edrat0 = calculate_line_profile(m3, x, d_gt, bins, plane)
edrat10 = calculate_line_profile(m3, x, d01, bins, plane)
edrat20 = calculate_line_profile(m3, x, d02, bins, plane)
edrat30 = calculate_line_profile(m3, x, d03, bins, plane)

plot(bins, edrat0, label = "Eddington ratio 0%", title = "α13 = 0.35, a = 0.998", legend=:topleft)
plot!(bins, edrat10, label = "Eddington ratio 10%")
plot!(bins, edrat20, label = "Eddington ratio 20%")
plot!(bins, edrat30, label = "Eddington ratio 30%")
