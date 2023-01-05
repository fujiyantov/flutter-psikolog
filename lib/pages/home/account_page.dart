import 'package:flutter/material.dart';
import 'package:psikolog/models/users.dart';
import 'package:psikolog/providers/user_provider.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    // provider
    UserProvider userProvider = Provider.of<UserProvider>(context);
    Users? user = userProvider.user;
    print(user);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 35,
        vertical: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'PROFILE',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
                child: const Icon(
                  Icons.logout,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      '${user?.profile}',
                    ),
                  ),
                  borderRadius: BorderRadius.circular(64),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.ideographic,
                    children: [
                      Container(
                        width: 80,
                        child: Text(
                          'Username',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      Text(': '),
                      Container(
                        width: 100,
                        child: Text(
                          user != null ? '${user.name}' : '-',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.ideographic,
                    children: [
                      Container(
                        width: 80,
                        child: Text(
                          'Email',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      Text(': '),
                      Container(
                        width: 100,
                        child: Text(
                          user != null ? '${user.email}' : '-',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            'DATA DIRI',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            thickness: 1,
            color: Colors.black26,
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.ideographic,
                children: [
                  Container(
                    width: 130,
                    child: Text(
                      'Nama Lengkap',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Text(': '),
                  Container(
                    width: 150,
                    child: Text(
                      user != null ? '${user.fullName}' : '-',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.ideographic,
                children: [
                  Container(
                    width: 130,
                    child: Text(
                      'NIM',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Text(': '),
                  Container(
                    width: 150,
                    child: Text(
                      '${user?.nim}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.ideographic,
                children: [
                  Container(
                    width: 130,
                    child: Text(
                      'Fakultas',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Text(': '),
                  Container(
                    width: 150,
                    child: Text(
                      '${user?.facultyName}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.ideographic,
                children: [
                  Container(
                    width: 130,
                    child: Text(
                      'Program Studi',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Text(': '),
                  Container(
                    width: 150,
                    child: Text(
                      '${user?.studyProgramName}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.ideographic,
                children: [
                  Container(
                    width: 130,
                    child: Text(
                      'No. Telp',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Text(': '),
                  Container(
                    width: 150,
                    child: Text(
                      '${user?.noTelp}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
