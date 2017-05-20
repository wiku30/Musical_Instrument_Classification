

function t=tmp_coef(file)
    ar = lp_w(file,[0.1 0.7]);
    t = norm(ar(1,:)-ar(2,:),2)
end