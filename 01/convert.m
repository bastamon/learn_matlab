%徐鸣
%1212050156
%十进制转二进制
function f=convert(input)
a=ceil(log10(input));
f=dec2base(input,2,a);
end
