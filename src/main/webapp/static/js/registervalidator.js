
	$(function () {
        $('form').bootstrapValidator({
　　　　　　　　message: 'This value is not valid',
            　feedbackIcons: {
            　　　　　　　　   },
            fields: {
            	userName: {
                    message: '用户名验证失败',
                    validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        },
               stringLength: {
                   min: 5,
                   max: 18,
                   message: '用户名长度必须在5到18位之间'
               }
                    }
                },
                phoneNumber: {
                    validators: {
                        notEmpty: {
                            message: '手机号码不能为空'
                        },
                        regexp: {
                            regexp: /(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/,
                            message: '电话号码不符合规范'
                        }
                    }
                },
                captcha: {
                	validators: {
                        notEmpty: {
                            message: '验证码不能为空'
                        }
                	}
                },
                password: {
                	validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        stringLength: {
                            min: 6,
                            max: 12,
                            message: '密码长度必须在6到12位之间'
                        }
                	}
                },
                confirmPassword: {
                	validators: {
                        notEmpty: {
                            message: '请再次输入密码'
                        },
                        identical: {
                            field: 'password',
                            message: '两次输入的密码不一致'
                        }
                	}
                },
                oldPass: {
                	validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        stringLength: {
                            min: 6,
                            max: 12,
                            message: '密码长度必须在6到12位之间'
                        }
                	}
                },
                newPass: {
                	validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        stringLength: {
                            min: 6,
                            max: 12,
                            message: '密码长度必须在6到12位之间'
                        }
                	}
                },
                newPassCommit: {
                	validators: {
                        notEmpty: {
                            message: '请再次输入密码'
                        },
                        identical: {
                            field: 'newPass',
                            message: '两次输入的密码不一致'
                        }
                	}
                },
                operatorname: {
                	validators: {
                        notEmpty: {
                            message: '姓名不能为空'
                        }
                	}
                },
                idcardno: {
                	validators: {
                        notEmpty: {
                            message: '身份证号不能为空'
                        },
                        regexp: {
                            regexp: /^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/,
                            message: '身份证号不符合规范'
                        }
                	}
                },
                mobilphone: {
                    validators: {
                        notEmpty: {
                            message: '手机号码不能为空'
                        },
                        regexp: {
                            regexp: /(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/,
                            message: '电话号码不符合规范'
                        }
                    }
                },
                restname: {
                	validators: {
                        notEmpty: {
                            message: '商户名不能为空'
                        }
                	}
                },
                address: {
                	validators: {
                        notEmpty: {
                            message: '详细地址不能为空'
                        }
                	}
                },
                phone: {
                	validators: {
                        notEmpty: {
                            message: '联系方式不能为空'
                        }
                	}
                },
                time: {
                	validators: {
                        notEmpty: {
                            message: '时间不能为空'
                        },
                        regexp: {
                            regexp: /^(0\d{1}|1\d{1}|2[0-3]):[0-5]\d{1}:([0-5]\d{1})$/,
                            message: '时间格式不符合规范'
                        }
                	}
                },
                capitaconsumption: {
                	validators: {
                        notEmpty: {
                            message: '人均消费不能为空'
                        }
                	}
                },
                space: {
                	validators: {
                        notEmpty: {
                            message: '占地面积不能为空'
                        }
                	}
                },
                staff: {
                	validators: {
                        notEmpty: {
                            message: '员工人数不能为空'
                        }
                	}
                }
            }
        });
    });