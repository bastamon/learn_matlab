function result = addexample(a,b)
if b<a
    error('input error!');
end
result = 0;
a=1;
b=100;
for i=a:b
    result=result+i;
end
