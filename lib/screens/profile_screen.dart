import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('username'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          // 프로필 정보 섹션
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 프로필 이미지와 통계
                Row(
                  children: [
                    // 프로필 이미지
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                        'https://via.placeholder.com/150',
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildStatColumn('게시물', '123'),
                          _buildStatColumn('팔로워', '1.5K'),
                          _buildStatColumn('팔로잉', '1K'),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // 사용자 이름과 자기소개
                const Text(
                  '사용자 이름',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Text('자기소개 텍스트가 들어갈 공간입니다.'),
                const SizedBox(height: 16),
                // 프로필 수정 버튼
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('프로필 수정'),
                ),
              ],
            ),
          ),
          // 게시물 그리드
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
              itemCount: 30, // 샘플 게시물 수
              itemBuilder: (context, index) {
                return Image.network(
                  'https://via.placeholder.com/150',
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String label, String count) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
} 