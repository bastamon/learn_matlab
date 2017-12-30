close all; clc; clear all;

p=[8/30 10/30 3/30 4/30 5/30];
%一连串已知概率
if length(find(p<0))~=0
    error('Negative component(s)!');
end
%找到已知信源小于0的概率长度，返回不合法错误
if sum(p)>1
    error('Not a prob.vector, components do not add up to 1');
end
%信源出现概率求和不等于1，则返回错误
disp('Symbol probability of the source:');
%显示字串符
n=length(p);
%信源概率长度
for i=1:n
    disp(['Prob(', char(64+i), ')', ': ', num2str(p(i))]);
end
%依次从ASCII码中字符A开始;将P矩阵中的概率数据,分别输显示
pause;

H=-sum(p.*log2(p));
%计算信息熵
disp(['Entropy of the source: ', num2str(H), ' bits']);
%将2进制转换成数字显示

L0=ceil(log2(n));
%计算出在进行huffman编码前的码长
disp(['Average code length before Huffman encoding: ', num2str(L0), ' bits']);
%显示应转换为数字的huffman码长
pause;

q=p;
%把p赋给q
m=zeros(n-1,n);
%建立0矩阵
for i=1:n-1
    [q, L]=sort(q);
    %为读取q中概率,将q升序后放入q再将L作为q中各元素存放的位置,
    m(i,:)=[L(1:n-i+1), zeros(1, i-1)];
    %由数组l 构建一个矩阵，该矩阵表明概率合并时的顺序，用于后面的编码
    q=[q(1)+q(2), q(3:n), 1];
    %将排序后的概率数组q 的前两项，即概率最小的两个数加和，得到新的一组概率序列
end

for i=1:n-1
    c(i,:)=blanks(n*n);
%生成一个n-1 行n 列，并且每个元素的的长度为n 的空白数组,c矩阵用于进行huffman 编码,并且在编码中与a矩阵有一定的对应关系
end

c(n-1, n)='0';
%霍夫曼编码运算加和运算时所得的最后两概率,将第n-1位的置0
c(n-1, 2*n)='1';
%将第n位的置1

for i=2:n-1
    c(n-i,1:n-1)=c(n-i+1, n*(find(m(n-i+1,:)==1))-(n-2):n*(find(m(n-i+1,:)==1)));
    %矩阵c 的第n-i 的第一个元素的n-1 的字符赋值为对应于a 矩阵中第n-i+1 行中值为1 的位置在c 矩阵中的编码值
    c(n-i,n)='0';
    %根据之前的规则，在分支的第一个元素最后补0
    c(n-i,n+1:2*n-1)=c(n-i,1:n-1);
    %矩阵c 的第n-i 的第二个元素的n-1 的字符与第n-i 行的第一个元素的前n-1 个符号相同，因为其根节点相同
    c(n-i,2*n)='1';
    %根据之前的规则，在分支的第一个元素最后补1
    for j=1:i-1
        c(n-i,(j+1)*n+1:(j+2)*n)=c(n-i+1, n*(find(m(n-i+1,:)==j+1)-1)+1:n*find(m(n-i+1,:)==j+1));
    %矩阵c 中第n-i 行第j+1 列的值等于对应于a 矩阵中第n-i+1 行中值为j+1 的前面一个元素的位置在c 矩阵中的编码值
    end
end
%完成huffman 码字的分配

for i=1:n
    h(i,1:n)=c(1,n*(find(m(1,:)==i)-1)+1:find(m(1,:)==i)*n);
    %用h表示最后的huffman 编码,矩阵h的第i行的元素对应于矩阵c的第一行的第i个元素
    L1(i)=length(find(abs(h(i,:))~=32));
    %计算每一个huffman 编码的长度
end

disp('Encoded results:');
%显示压缩结果
for i=1:n
    disp([char(64+i), ': ', h(i,:)]);
    %显示原信息
end

pause;
L=sum(p.*L1);
%计算平均码长
disp(['Average code length after Huffman encoding: ', num2str(L)]);
%显示霍夫曼编码后的平均码长
pause;
disp(['Compression ratio = ', num2str(L0), '/', num2str(L), ' = ', num2str(L0/L)]);
%显示压缩速率比(原码长/压缩后码长)