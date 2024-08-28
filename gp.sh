#!/bin/bash

# Semantic Commit Messages
# Sumber informasi :
# 1. https://gist.github.com/alpteo/e93d754e5e09907c6362c4230fb66f87
# 2. https://gist.github.com/parmentf/035de27d6ed1dce0b36a 

# Fungsi untuk perintah 'init'
init_command() {
    echo ==================================================
    read -p "Silahkan masukan link github Anda : " github_link
    if [[ -z "$github_link" ]]; then
        echo "Anda harus mengisi repositori Github!"
        exit 1
    fi
    echo ==================================================

    echo ==================================================
    echo -e "\033[1;41mInital commit pada link : $github_link \033[0m"
    echo ==================================================

    rm -rf .git

    git init
    git remote remove origin 2>/dev/null
    git remote add origin "$github_link"
    git add .
    git commit -m "🎉 Initial commit"
    git push --set-upstream origin master --force

    echo -e "\033[1;41mThat's it. Silahkan kembali ke workspace Anda! \033[0m"
}

# Fungsi untuk perintah 'push'
push_command() {
    echo "=================================================="
    echo -e "\033[1;41mFile yang telah Anda kerjakan : \033[0m"
    git status
    echo "=================================================="

    echo ==================================================
    echo -e "\033[1;41mTentukan tipe commit message Anda ! \033[0m"
    echo "1. ✨ feat: deskripsi"
    echo "2. 🐛 fix: deskripsi"
    echo "3. 📝 docs: deskripsi"
    echo "4. 🎨 style: deskripsi"
    echo "5. 🔨 refactor: deskripsi"
    echo "6. 🐎 perf: deskripsi"
    echo "7. 🚨 test: deskripsi"
    echo "8. 🔧 chore: deskripsi"
    echo ==================================================

    read -p "Silahkan pilih 1 - 8 : " choice

    case $choice in
        1) type="✨ feat" ;;
        2) type="🐛 fix" ;;
        3) type="📝 docs" ;;
        4) type="🎨 style" ;;
        5) type="🔨 refactor" ;;
        6) type="🐎 perf" ;;
        7) type="🚨 test" ;;
        8) type="🔧 chore" ;;
        *) echo "Tipe commit yang Anda maksud tidak ada!"; exit 1 ;;
    esac

    read -p "Masukan deskripsi commit Anda : " desc

    echo ==================================================
    echo -e "\033[1;41mHasil commit Anda : \033[0m"
    message="$type : $desc"

    git add .
    git commit -m "$message"
    git push

    echo -e "\033[1;41mThat's it. Silahkan kembali ke workspace Anda! \033[0m"
}

# Fungsi untuk perintah 'create_branch'
create_branch_command() {
    echo ==================================================
    echo -e "\033[1;41mMenampilkan branch yang ada saat ini : \033[0m"
    git --no-pager branch
    echo ==================================================

    read -p "Silahkan masukan nama branch yang ingin Anda buat : " new_branch

    git checkout -b "$new_branch"

    echo ==================================================
    echo -e "\033[1;41mSaat ini Anda di branch : \033[0m"
    git branch --show-current
    echo ==================================================

    echo -e "\033[1;41mThat's it. Silahkan kembali ke workspace Anda! \033[0m"
}

# Fungsi untuk perintah 'switch_branch'
switch_branch_command() {
    echo ==================================================
    echo -e "\033[1;41mMenampilkan branch yang ada saat ini : \033[0m"
    git --no-pager branch
    echo ==================================================

    read -p "Silahkan masukan nama branch yang Anda maksud : " existing_branch

    git checkout "$existing_branch"

    echo ==================================================
    echo -e "\033[1;41mSaat ini Anda di branch : \033[0m"
    git branch --show-current
    echo ==================================================

    echo -e "\033[1;41mThat's it. Silahkan kembali ke workspace Anda! \033[0m"
}

push_to_branch_command() {
    echo "=================================================="
    echo -e "\033[1;41mFile yang telah Anda kerjakan : \033[0m"
    git status
    echo "=================================================="

    echo ==================================================
    echo -e "\033[1;41mTentukan tipe commit message Anda ! \033[0m"
    echo "1. ✨ feat: deskripsi"
    echo "2. 🐛 fix: deskripsi"
    echo "3. 📝 docs: deskripsi"
    echo "4. 🎨 style: deskripsi"
    echo "5. 🔨 refactor: deskripsi"
    echo "6. 🐎 perf: deskripsi"
    echo "7. 🚨 test: deskripsi"
    echo "8. 🔧 chore: deskripsi"
    echo ==================================================

    read -p "Silahkan pilih 1 - 8 : " choice

    case $choice in
        1) type="✨ feat" ;;
        2) type="🐛 fix" ;;
        3) type="📝 docs" ;;
        4) type="🎨 style" ;;
        5) type="🔨 refactor" ;;
        6) type="🐎 perf" ;;
        7) type="🚨 test" ;;
        8) type="🔧 chore" ;;
        *) echo "Tipe commit yang Anda maksud tidak ada!"; exit 1 ;;
    esac

    read -p "Masukan deskripsi commit Anda : " desc

    echo ==================================================
    echo -e "\033[1;41mHasil commit Anda : \033[0m"
    message="$type: $desc"

    git add .
    git commit -m "$message"

    # Meminta nama branch untuk push
    echo ==================================================
    echo -e "\033[1;41mMenampilkan branch Anda saat ini : \033[0m"
    git --no-pager branch
    echo ==================================================

    read -p "Silahkan masukkan nama branch yang akan dipush: " branch_name

    git push origin "$branch_name"

    echo -e "\033[1;41mThat's it. Silahkan kembali ke workspace Anda! \033[0m"
}

switch_to_main_branch_command() {
    # Mendeteksi branch utama
    if git show-ref --verify --quiet refs/heads/main; then
        main_branch="main"
    elif git show-ref --verify --quiet refs/heads/master; then
        main_branch="master"
    else
        echo -e "\033[1;41mBranch utama (master/main) tidak ditemukan. Tidak dapat beralih. \033[0m"
        exit 1
    fi

    git checkout "$main_branch"
    git fetch
    git pull

    echo ==================================================
    echo -e "\033[1;41mSaat ini Anda di branch : \033[0m"
    git branch --show-current
    echo ==================================================

    echo -e "\033[1;41mThat's it. Silahkan kembali ke workspace Anda! \033[0m"
}



# Menampilkan menu pilihan
echo ==================================================
echo -e "\033[1;41mTentukan yang mana Anda butuhkan : \033[0m"
echo "1. Initial commit"
echo "2. Commit and push! (All in one)"
echo "3. New branch"
echo "4. Switch branch"
echo "5. Push branch"
echo "6. Switch Branch Main (Wajib sudah PR dan Merge di Github)"
echo ==================================================

read -p "Silahkan pilih 1 - 6 : " choice

# Menggunakan case untuk menentukan perintah berdasarkan pilihan
case $choice in
    1) command="init_command" ;;
    2) command="push_command" ;;
    3) command="create_branch_command" ;;
    4) command="switch_branch_command" ;;
    5) command="push_to_branch_command" ;;
    5) command="switch_to_main_branch_command" ;;
    *) echo "Pilihan tidak valid."; exit 1 ;;
esac

# Eksekusi perintah yang dipilih dengan eval
eval "$command"
