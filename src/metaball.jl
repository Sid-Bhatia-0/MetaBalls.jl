struct MetaBall{T}
    i_center::T
    j_center::T
    radius::T
end

function generate_field!(field::AbstractMatrix, metaballs::Array{MetaBall{T}, 1}) where {T}
    height, width = size(field)
    for j in 1:width
        for i in 1:height
            for metaball in metaballs
                field[i, j] += (metaball.radius ^ 2) / ((i - metaball.i_center) ^ 2 + (j - metaball.j_center) ^ 2)
            end
        end
    end

    return nothing
end
