theta=1;
X=[rand(200,1),0.1*rand(200,1)]*[cos(theta), -sin(theta); sin(theta), cos(theta)];
figure;
scatter(X(:,1),X(:,2),20,'ro','filled')
axis equal

[COEFF,SCORE,latent] = princomp(X);

figure;
scatter(SCORE(:,1),SCORE(:,2),20,'ro','filled')
axis equal

latent./sum(latent)

k=1;% the number of PC
test=mean(X)+ 1*sqrt(latent(k))*COEFF(:,k)';
figure;
scatter(X(:,1),X(:,2),20,'ro','filled')
hold on
scatter(test(1),test(2),60,'ko','filled')
axis equal

new_sample=[0.5*rand(10,1),0.1*rand(10,1)]*[cos(theta), -sin(theta); sin(theta), cos(theta)];

new_sample_centered=new_sample-repmat(mean(X),size(new_sample,1),1);
new_sample_mapped=new_sample_centered*COEFF;

figure;
scatter(SCORE(:,1),SCORE(:,2),20,'ro','filled')
hold on
scatter(new_sample_mapped(:,1),new_sample_mapped(:,2),60,'bo','filled')
axis equal


clear all
X=[rand(20,10000),0.1*rand(20,10000)];


tic
[COEFF,SCORE,latent] = princomp(X);
toc

tic
X_center=X-repmat(mean(X), size(X,1),1);
[S V D]=svd(X_center*X_center');
COEFF1=X_center'*S./repmat(sqrt(diag(V))',size(X,2),1);
SCORE1=X_center*COEFF1;
latent1=diag(cov(SCORE1));
toc