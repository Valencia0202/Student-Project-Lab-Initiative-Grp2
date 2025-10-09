import 'package:flutter/material.dart';
import '/tools/size_scaling.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmailField extends StatefulWidget {
  const EmailField({super.key});

  @override
  State<EmailField> createState() => EmailFieldState();
}

class EmailFieldState extends State<EmailField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeHelper.init(context); 

  
      return SizedBox(
        width: SizeHelper.w(322),
        height: SizeHelper.h(47),
        child: Stack(
          children: <Widget>[
            // Animated background / border when focused
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              width: SizeHelper.w(322),
              height: SizeHelper.h(47),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                color: const Color.fromRGBO(220, 255, 222, 1),
                boxShadow: _isFocused
                    ? [
                        BoxShadow(
                          color: Colors.green.withValues(alpha: 0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        )
                      ]
                    : null,
                border: Border.all(
                  color: _isFocused ? Colors.green : Colors.transparent,
                  width: _isFocused ? 1.5 : 0,
                ),
              ),
            ),

            // Email icon
            Positioned(
              top: SizeHelper.h(14),
              left: SizeHelper.w(13),
              child: SizedBox(
                width: SizeHelper.w(20),
                height: SizeHelper.w(20),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/email.svg',
                    semanticsLabel: 'email icon',
                  ),
                ),
              ),
            ),

            // TextField with animated hint (fades away when focused or when text is present)
            Positioned(
              top: 0,
              left: SizeHelper.w(45),
              right: SizeHelper.w(12),
              bottom: 0,
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          // Custom animated hint label
                          AnimatedOpacity(
                            opacity:
                                (_isFocused || _controller.text.isNotEmpty)
                                    ? 0.0
                                    : 1.0,
                            duration: const Duration(milliseconds: 200),
                            child: Text(
                              'Enter your email',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: SizeHelper.h(15),
                                color: Colors.grey[700],
                              ),
                            ),
                          ),

                          // Actual TextField (transparent hint because we show a custom one)
                          TextField(
                            controller: _controller,
                            focusNode: _focusNode,
                            keyboardType: TextInputType.emailAddress,
                            cursorHeight: SizeHelper.h(18),
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: SizeHelper.h(15),
                              color: Colors.black87,
                            ),
                            decoration: const InputDecoration(
                              isDense: true,
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 12),
                              border: InputBorder.none,
                              hintText: null, // we use custom hint above
                            ),
                            onChanged: (_) {
                              // rebuild to update the animated hint visibility
                              setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// name text field
class NameField extends StatefulWidget {
  const NameField({super.key});

  @override
  State<NameField> createState() => NameFieldState();
}

class NameFieldState extends State<NameField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeHelper.init(context); 

      return SizedBox(
        width: SizeHelper.w(322),
        height: SizeHelper.h(47),
        child: Stack(
          children: <Widget>[
            // Animated background / border when focused
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              width: SizeHelper.w(322),
              height: SizeHelper.h(47),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                color: const Color.fromRGBO(220, 255, 222, 1),
                boxShadow: _isFocused
                    ? [
                        BoxShadow(
                          color: Colors.green.withValues(alpha: 0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        )
                      ]
                    : null,
                border: Border.all(
                  color: _isFocused ? Colors.green : Colors.transparent,
                  width: _isFocused ? 1.5 : 0,
                ),
              ),
            ),

            Positioned(
              top: SizeHelper.h(14),
              left: SizeHelper.w(13),
              child: SizedBox(
                width: SizeHelper.w(20),
                height: SizeHelper.w(20),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/profile.svg',
                    semanticsLabel: 'profile icon',
                  ),
                ),
              ),
            ),

            // TextField with animated hint (fades away when focused or when text is present)
            Positioned(
              top: 0,
              left: SizeHelper.w(45),
              right: SizeHelper.w(12),
              bottom: 0,
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          // Custom animated hint label
                          AnimatedOpacity(
                            opacity:
                                (_isFocused || _controller.text.isNotEmpty)
                                    ? 0.0
                                    : 1.0,
                            duration: const Duration(milliseconds: 200),
                            child: Text(
                              'Enter your name',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: SizeHelper.h(10),
                                color: Colors.grey[700],
                              ),
                            ),
                          ),

                          // Actual TextField (transparent hint because we show a custom one)
                          TextField(
                            controller: _controller,
                            focusNode: _focusNode,
                            keyboardType: TextInputType.emailAddress,
                            cursorHeight: SizeHelper.h(18),
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: SizeHelper.h(10),
                              color: Colors.black87,
                            ),
                            decoration: const InputDecoration(
                              isDense: true,
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 12),
                              border: InputBorder.none,
                              hintText: null, // we use custom hint above
                            ),
                            onChanged: (_) {
                              // rebuild to update the animated hint visibility
                              setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// name text field
class PasswordField extends StatefulWidget {
  const PasswordField({super.key});

  @override
  State<PasswordField> createState() => PasswordFieldState();
}

class PasswordFieldState extends State<PasswordField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeHelper.init(context); 

      return SizedBox(
        width: SizeHelper.w(322),
        height: SizeHelper.h(47),
        child: Stack(
          children: <Widget>[
            // Animated background / border when focused
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              width: SizeHelper.w(322),
              height: SizeHelper.h(47),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                color: const Color.fromRGBO(220, 255, 222, 1),
                boxShadow: _isFocused
                    ? [
                        BoxShadow(
                          color: Colors.green.withValues(alpha: 0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        )
                      ]
                    : null,
                border: Border.all(
                  color: _isFocused ? Colors.green : Colors.transparent,
                  width: _isFocused ? 1.5 : 0,
                ),
              ),
            ),

            Positioned(
              top: SizeHelper.h(14),
              left: SizeHelper.w(13),
              child: SizedBox(
                width: SizeHelper.w(20),
                height: SizeHelper.w(20),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/password.svg',
                    semanticsLabel: 'password icon',
                  ),
                ),
              ),
            ),

            Positioned(
              top: SizeHelper.h(18),
              left: SizeHelper.w(296),
              child: SizedBox(
                width: SizeHelper.w(14),
                height: SizeHelper.w(14),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/visible.svg',
                    semanticsLabel: 'visible icon', 
                  ),
                ),
              ),
            ),

            // TextField with animated hint (fades away when focused or when text is present)
            Positioned(
              top: 0,
              left: SizeHelper.w(45),
              right: SizeHelper.w(12),
              bottom: 0,
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          // Custom animated hint label
                          AnimatedOpacity(
                            opacity:
                                (_isFocused || _controller.text.isNotEmpty)
                                    ? 0.0
                                    : 1.0,
                            duration: const Duration(milliseconds: 200),
                            child: Text(
                              'Enter your password',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: SizeHelper.h(10),
                                color: Colors.grey[700],
                              ),
                            ),
                          ),

                          // Actual TextField (transparent hint because we show a custom one)
                          TextField(
                            controller: _controller,
                            focusNode: _focusNode,
                            keyboardType: TextInputType.emailAddress,
                            cursorHeight: SizeHelper.h(18),
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: SizeHelper.h(10),
                              color: Colors.black87,
                            ),
                            decoration: const InputDecoration(
                              isDense: true,
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 12),
                              border: InputBorder.none,
                              hintText: null, // we use custom hint above
                            ),
                            onChanged: (_) {
                              // rebuild to update the animated hint visibility
                              setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
