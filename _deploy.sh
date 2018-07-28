# configure your name and email if you have not done so
git config --global user.email "psychelzh@outlook.com"
git config --global user.name "Liang Zhang"

# clone the repository to the book-output directory
git clone -b gh-pages \
  https://${GITHUB_PAT}@github.com/${TRAVIS_REPO_SLUG}.git \
  book-output
cd book-output
git rm -rf *
# keep .nojekyll
git checkout HEAD .nojekyll
cp -r ../phdrule/* ./
git add --all *
git commit -m "Update the book (travis build ${TRAVIS_BUILD_NUMBER})"
git push -q origin gh-pages
